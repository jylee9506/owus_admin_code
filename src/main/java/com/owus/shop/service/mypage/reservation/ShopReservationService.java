package com.owus.shop.service.mypage.reservation;

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.shop.dto.mypage.reservation.ReservationDTO;
import com.owus.shop.dto.mypage.reservation.ReservationListDTO;
import org.springframework.transaction.annotation.Transactional;


@Transactional
public interface ShopReservationService {

    ListResponseDTO<ReservationListDTO> selectList(ListDTO listDTO, Integer mid);

    ReservationDTO selectOne(Integer rsvNo);

    void update(ReservationDTO reservationDTO);

}
