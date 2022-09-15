package com.owus.common.util;
/*
 * author          :
 * date            : 2022-05-01
 * time            : 오후 2:58
 * description     :
 * ================================================
 */

import lombok.Builder;
import lombok.Data;

@Data
public class PageMaker {

    private int page; // 현재 페이지
    private int start;
    private int end;
    private boolean prev;
    private boolean next;
    private int total;
    private int size;

    @Builder(builderMethodName = "pg")
    public PageMaker(int page, int size, int total) {
        this.page = page <= 0 ? 1 : page;
        this.size = Math.max(size, 10);
        this.total = total;

        int lastPage = (int) (Math.ceil(total / (double)size));
        int endPage = (int) (Math.ceil(this.page / 10.0) * 10);

        this.start = endPage - 9;
        this.end = Math.min(lastPage, endPage);
        this.prev = this.start != 1;
        this.next = this.end != lastPage;
    }

}
