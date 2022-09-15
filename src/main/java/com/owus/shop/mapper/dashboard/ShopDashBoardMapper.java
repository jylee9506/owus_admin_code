package com.owus.shop.mapper.dashboard;
/*
 * author          :
 * date            : 2022-06-21
 * time            : 오전 12:28
 * description     :
 * ================================================
 */

import com.owus.shop.domain.dashboard.RecentRsvVO;
import com.owus.shop.domain.dashboard.ReservationSummaryVO;

import java.util.List;

public interface ShopDashBoardMapper {

    List<ReservationSummaryVO> summary(Integer mno);

    List<RecentRsvVO> recentRsv(Integer mno);

}
