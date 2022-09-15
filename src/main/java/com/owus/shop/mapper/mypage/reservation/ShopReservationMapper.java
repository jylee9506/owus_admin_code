package com.owus.shop.mapper.mypage.reservation;

import com.owus.common.dto.ListDTO;
import com.owus.common.mapper.GenericMapper;
import com.owus.shop.domain.mypage.reservation.ReservationVO;
import com.owus.shop.dto.mypage.reservation.ReservationDTO;
import com.owus.shop.dto.mypage.reservation.ReservationListDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopReservationMapper extends GenericMapper<ReservationDTO, Integer> {
    List<ReservationListDTO> selectList(@Param("listDTO") ListDTO listDTO, @Param("mno") Integer mno);

    int getTotal(@Param("listDTO") ListDTO listDTO, @Param("mno") Integer mno);

    ReservationDTO selectOne(Integer rsvno);

    void update(ReservationVO reservationVO);
}
