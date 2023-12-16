package com.model.orders;
 
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
 
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class OrdersDTO {
  private int   orderno              ;
  private String id                  ;
  private String mname               ;
  private String odate               ;
  private String ostate              ;
  private int    total                ;
  private String payment             ;
  private String reqtext             ;
  private String size                 ;
 
  private List<OrderdetailDTO> list  ;
}