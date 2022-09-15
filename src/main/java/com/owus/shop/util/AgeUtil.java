package com.owus.shop.util;
/*
 * author          :
 * date            : 2022-06-15
 * time            : 오후 7:26
 * description     :
 * ================================================
 */

import java.text.SimpleDateFormat;
import java.util.Date;

public enum AgeUtil {
    INSTANCE;
    AgeUtil(){}

    public Integer getAgeFromYear(String targetYear){
        //나이 계산
        SimpleDateFormat sdfCurrentYear = new SimpleDateFormat("yyyy");
        Date now = new Date();
        Integer year = Integer.parseInt(sdfCurrentYear.format(now));
        return year - Integer.parseInt(targetYear);
    }

}
