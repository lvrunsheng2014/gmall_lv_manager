package com.lv.service;

import java.util.List;

import com.lv.bean.MODEL_T_MALL_ATTR;
import com.lv.bean.OBJECT_T_MALL_ATTR;

public interface AttrService {

	void saveAttr(int flbh2, List<OBJECT_T_MALL_ATTR> list_attr);

	List<OBJECT_T_MALL_ATTR> get_attr_list(int flbh2);
	
	
 
	
}
