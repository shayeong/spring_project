package com.model.orders;
 
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
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
public class OrderdetailDTO {
 
private int    odno                 ;
private int    orderno                ;
private int    contentsno             ;
private int    quantity             ;
private String pname               ;
private String size                  ;
}