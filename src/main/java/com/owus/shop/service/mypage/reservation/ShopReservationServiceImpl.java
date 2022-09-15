package com.owus.shop.service.mypage.reservation;
/*
 * author          :
 * date            : 2022-06-07
 * time            : 오후 3:47
 * description     :
 * ================================================
 */

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.shop.dto.mypage.reservation.ReservationDTO;
import com.owus.shop.dto.mypage.reservation.ReservationListDTO;
import com.owus.shop.mapper.mypage.reservation.ShopReservationMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class ShopReservationServiceImpl implements ShopReservationService {
    private final ModelMapper modelMapper;
    private final ShopReservationMapper reservationMapper;


    @Override
    public ListResponseDTO<ReservationListDTO> selectList(ListDTO listDTO, Integer mid) {

        return ListResponseDTO.<ReservationListDTO>builder()
                .dtoList(reservationMapper.selectList(listDTO, mid))
                .total(reservationMapper.getTotal(listDTO, mid))
                .build();
    }

    @Override
    public ReservationDTO selectOne(Integer rsvNo) {
        return reservationMapper.selectOne(rsvNo);
    }

    @Override
    public void update(ReservationDTO reservationDTO) {
        reservationMapper.update(reservationDTO);
    }
}
