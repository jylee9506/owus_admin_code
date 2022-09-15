package com.owus.shop.domain.dashboard;
/*
 * author          :
 * date            : 2022-06-21
 * time            : 오전 12:21
 * description     :
 * ================================================
 */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReservationSummaryVO {

    private Long totalRsv;
    private Long totalPrice;
    private Long totalPeople;
    private LocalDate dt;
}
