package com.owus.shop.dto.message;
/*
 * author          :
 * date            : 2022-06-22
 * time            : 오후 4:45
 * description     :
 * ================================================
 */

import lombok.Data;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URLEncoder;

@Data
public class MsgListDTO {

    private Integer mno;
    private Integer tabType;

    private Integer page;
    private Integer size;

    private String type;
    private String keyword;

    public MsgListDTO() {
        this.page = 1;
        this.size = 10;
        this.tabType = 0;
    }

    public void setType(String type) {
        this.type = type.trim().length() == 0 ? null : type.trim();
    }

    public String[] getTypes() {
        if(type == null || type.trim().length() == 0) {
            return new String[]{};
        }
        return type.split("");
    }

    public int getSkip() {
        return (this.page - 1) * this.size;
    }

    public String getKeyword() {
        return keyword == null || keyword.trim().length() == 0 ? null : keyword.trim();
    }

    public String getLink() {
        return this.getQuery(true);
    }

    private String getQuery(boolean includePage) {
        UriComponentsBuilder builder = UriComponentsBuilder.newInstance();

        if(includePage) builder.queryParam("page", getPage());
        builder.queryParam("size", getSize());

        if(this.type != null) {
            builder.queryParam("type", this.type);
        }
        if(this.keyword != null) {
            try {
                String enStr = URLEncoder.encode(getKeyword(), "UTF-8");
                builder.queryParam("keyword", enStr);
            } catch (Exception e) {
//                log.warn(e);
            }
        }

        return builder.build().toString();
    }
}
