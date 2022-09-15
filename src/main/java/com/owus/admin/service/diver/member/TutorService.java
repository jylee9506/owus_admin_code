package com.owus.admin.service.diver.member;

import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ListResponseDTO;
import com.owus.admin.dto.diver.member.TutorDTO;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface TutorService {


 ListResponseDTO<TutorDTO> selectList(ListDTO listDTO);

 TutorDTO selectOne(Integer bno);

 void approve(TutorDTO tutorDTO);

 TutorDTO getOne(Integer mno);
}
