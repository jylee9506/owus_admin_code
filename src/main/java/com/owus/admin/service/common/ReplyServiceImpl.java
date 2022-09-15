package com.owus.admin.service.common;
/*
 * author          :
 * date            : 2022-05-23
 * time            : 오후 7:10
 * description     :
 * ================================================
 */

import com.owus.common.domain.ReplyVO;
import com.owus.common.dto.ListDTO;
import com.owus.common.dto.ReplyDTO;
import com.owus.admin.mapper.common.ReplyMapper;
import com.owus.admin.mapper.ask.AskMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor

public class ReplyServiceImpl implements ReplyService<ReplyDTO> {

    private final ReplyMapper replyMapper;
    private final AskMapper diverAskMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<ReplyDTO> getList(Integer bno, ListDTO listDTO) {
        List<ReplyVO> voList = replyMapper.selectList(bno, listDTO);
        List<ReplyDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, ReplyDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public List<ReplyDTO> getSubList(Integer bno, Integer rno) {
        List<ReplyVO> voList = replyMapper.selectSubList(bno, rno);
        List<ReplyDTO> dtoList = voList.stream()
                .map(vo -> modelMapper.map(vo, ReplyDTO.class))
                .collect(Collectors.toList());

        return dtoList;
    }

    @Override
    public int addOne(ReplyDTO replyDTO) {
        ReplyVO vo = modelMapper.map(replyDTO, ReplyVO.class);

        replyMapper.insert(vo);

        if(vo.getParent() == 0)
            diverAskMapper.updateReplyCount(vo.getBno(), 1);

        return replyMapper.getTotal(vo.getBno(), vo.getParent());
    }

    @Override
    public void updateOne(ReplyDTO replyDTO) {
        log.info("--------- update reply");
        log.info(replyDTO);

        ReplyVO replyVO = modelMapper.map(replyDTO, ReplyVO.class);
        replyMapper.update(replyVO);

    }

    @Override
    public void removeOne(ReplyDTO replyDTO) {
        replyDTO.setContent("삭제된 댓글");
        replyDTO.setDelFlag(true);
        updateOne(replyDTO);
    }
}
