package com.owus.shop.dto.dashboard;
/*
 * author          :
 * date            : 2022-06-21
 * time            : 오전 12:18
 * description     :
 * ================================================
 */

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;

@Data
public class ReservationSummaryDTO {

    private Long totalRsv;
    private Long totalPrice;
    private Long totalPeople;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    private LocalDate dt;

}
