package com.owus.security.domain;
/*
 * author          :
 * date            : 2022-05-19
 * time            : 오후 8:27
 * description     :
 * ================================================
 */

import lombok.*;

@Getter
@Builder
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class AuthVO {
    private String id;
    private String roleName;
}
