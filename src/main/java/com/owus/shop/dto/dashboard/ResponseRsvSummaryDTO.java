package com.owus.shop.dto.dashboard;
/*
 * author          :
 * date            : 2022-06-21
 * time            : 오전 12:40
 * description     :
 * ================================================
 */

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ResponseRsvSummaryDTO {

    private Long lastRsv;
    private Long lastPrice;
    private Long lastPeople;

    @Builder.Default
    private Long accRsv = 0L;
    @Builder.Default
    private Long accPrice = 0L;
    @Builder.Default
    private Long accPeople = 0L;

    List<ReservationSummaryDTO> dtoList;

    @Builder(builderMethodName = "dl")
    public ResponseRsvSummaryDTO(List<ReservationSummaryDTO> dtoList) {
        this.dtoList = dtoList;

        dtoList.forEach(dto -> {
            this.accRsv += dto.getTotalRsv();
            this.accPrice += dto.getTotalPrice();
            this.accPeople += dto.getTotalPeople();
        });

        ReservationSummaryDTO lastDTO = dtoList.get(dtoList.size()-1);

        this.lastRsv = lastDTO.getTotalRsv();
        this.lastPrice = lastDTO.getTotalPrice();
        this.lastPeople = lastDTO.getTotalPeople();
    }
}
