package com.lv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lv.bean.OBJECT_T_MALL_ATTR;
import com.lv.bean.T_MALL_VALUE;

public interface AttrMapper {

	void insertAttr(@Param("flbh2") int flbh2,@Param("attr") OBJECT_T_MALL_ATTR attr);

	void insertValues(@Param("attr_id")  int attr_id,@Param("list_value") List<T_MALL_VALUE> list_value);

	List<OBJECT_T_MALL_ATTR> select_attr_list(int flbh2);

	

}
