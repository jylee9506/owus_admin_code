package com.owus.admin.diver.member;


import com.owus.admin.dto.diver.member.TutorDTO;
import com.owus.admin.service.diver.member.TutorService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class ServiceTests {

    @Autowired
    private TutorService tutorService;

    @Test
    public void test1(){
        TutorDTO tutorDTO=tutorService.getOne(16);

        log.info(tutorDTO);
    }
}
