package com.lv.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lv.bean.T_MALL_PRODUCT;

public interface SpuMapper {

	void insertSpu(T_MALL_PRODUCT spu);

	void insertSpuImg(Map<Object, Object> map);

	List<T_MALL_PRODUCT> select_Spu_list(Map<Object, Object> map);
	
	
	

	//void insertSpu(String shp_mch, String shp_msh);

}
