package com.six.elm.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryAddress {
    private Integer daId;
    private String contactName;
    private String contactSex;
    private String contactTel;
    private String address;
    private String userId;
}
