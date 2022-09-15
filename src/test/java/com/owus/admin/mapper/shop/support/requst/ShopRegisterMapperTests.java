package com.owus.admin.mapper.shop.support.requst;

import com.owus.common.mapper.FileMapper;
import com.owus.shop.domain.support.request.MemberVO;
import com.owus.shop.domain.support.request.ShopAllVO;
import com.owus.shop.domain.support.request.ShopVO;
import com.owus.shop.mapper.support.request.ShopRegisterMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class ShopRegisterMapperTests {

    @Autowired(required = false)
    private ShopRegisterMapper shopRegisterMapper;

    @Autowired(required = false)
    private FileMapper fileMapper;

    @Test
    public void test1(){


        ShopAllVO shopAllVO = shopRegisterMapper.selectOneAll(105);
        log.info(shopAllVO);
    }
    @Test
    public void test2(){
        fileMapper.delete(107);

    }
    @Test
    public void test3(){

        shopRegisterMapper.update(107);

    }
//    @Test
//    public void test4(){
//
//        shopRegisterMapper.modify(105);
//
//
//    }
}
