package com.owus.shop.dto.mypage.info;
/*
 * author          :
 * date            : 2022-05-01
 * time            : 오후 1:54
 * description     :
 * ================================================
 */

import com.owus.shop.util.AgeUtil;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URLEncoder;

@Log4j2
@Getter
@ToString
@Builder
@AllArgsConstructor
public class ListDTO {

    private Integer page;
    private Integer size;

//    private String link;
//    private String linkWithoutPage;
    private String oldKeyword;
    private String type;
    private String keyword;
    private Long category;
    private Long state;
    private Integer mtype;

    public ListDTO() {
        this.page = 1;
        this.size = 10;
        this.category = 0L;
        this.state = 0L;
    }

    public void setMtype(Integer mtype) {
        this.mtype = mtype;
    }

    public void setState(Long state) {
        this.state = (state == null || state < 0) ? 0L : state;
    }

    public void setPage(Integer page) {
        this.page = (page == null || page <= 0) ? 1 : page;
    }

    public void setSize(Integer size) {
        this.size = (size == null || size < 10) ? 10 : size;
    }

    public void setCategory(Long category) {
        this.category = (category == null || category < 0) ? 0 : category;
    }

    public int getSkip() {
        return (this.page - 1) * this.size;
    }

    public void setType(String type) {
        this.type = type.trim().length() == 0 ? null : type.trim();
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String[] getTypes() {
        if(type == null || type.trim().length() == 0) {
            return new String[]{};
        }
        return type.split("");
    }

    public Integer getMtype() {
        return mtype;
    }

    public String getType() {
        return type;
    }

    public String getOldKeyword() {
        //나이 검색
        boolean oldKeword = type !=null && type.trim().equals("o") && keyword != null && keyword.trim().length() != 0;
        if(oldKeword){
            Integer birthyear = AgeUtil.INSTANCE.getAgeFromYear(keyword);
            log.info(birthyear);
            return String.valueOf(birthyear);
        }
        return keyword == null || keyword.trim().length() == 0 ? null : keyword.trim();
    }

    public String getKeyword() {
        return keyword == null || keyword.trim().length() == 0 ? null : keyword.trim();
    }

    public String getLink() {
        return this.getQuery(true);
    }

    public String getLinkWithoutPage() {
        return this.getQuery(false);
    }

    private String getQuery(boolean includePage) {
        UriComponentsBuilder builder = UriComponentsBuilder.newInstance();

        if(includePage) builder.queryParam("page", getPage());
        builder.queryParam("size", getSize());
        builder.queryParam("category", getCategory());
        builder.queryParam("state", getState());

        if(this.type != null) {
            builder.queryParam("type", this.type);
        }
        if(this.keyword != null) {
            try {
                String enStr = URLEncoder.encode(getKeyword(), "UTF-8");
                builder.queryParam("keyword", enStr);
            } catch (Exception e) {
                log.warn(e);
            }
        }

        return builder.build().toString();
    }
}
