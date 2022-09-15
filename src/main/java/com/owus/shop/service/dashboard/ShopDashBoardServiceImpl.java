package com.owus.shop.service.dashboard;
/*
 * author          :
 * date            : 2022-06-21
 * time            : 오전 12:27
 * description     :
 * ================================================
 */

import com.owus.shop.domain.dashboard.RecentRsvVO;
import com.owus.shop.domain.dashboard.ReservationSummaryVO;
import com.owus.shop.dto.dashboard.RecentRsvDTO;
import com.owus.shop.dto.dashboard.ReservationSummaryDTO;
import com.owus.shop.mapper.dashboard.ShopDashBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class ShopDashBoardServiceImpl implements ShopDashBoardService{

    private final ShopDashBoardMapper shopDashBoardMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<ReservationSummaryDTO> summary(Integer mno) {
        List<ReservationSummaryVO> voList = shopDashBoardMapper.summary(mno);

        return voList.stream()
                .map(vo -> modelMapper.map(vo, ReservationSummaryDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<RecentRsvDTO> recentRsv(Integer mno) {

        List<RecentRsvVO> voList = shopDashBoardMapper.recentRsv(mno);

        return voList.stream()
                .map(vo -> modelMapper.map(vo, RecentRsvDTO.class))
                .collect(Collectors.toList());
    }
}
