package com.owus.shop.service.dashboard;
/*
 * author          :
 * date            : 2022-06-21
 * time            : 오전 12:26
 * description     :
 * ================================================
 */

import com.owus.shop.dto.dashboard.RecentRsvDTO;
import com.owus.shop.dto.dashboard.ReservationSummaryDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface ShopDashBoardService {

    List<ReservationSummaryDTO> summary(Integer mno);

    List<RecentRsvDTO> recentRsv(Integer mno);

}
