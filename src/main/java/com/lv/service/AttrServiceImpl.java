package com.lv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lv.bean.MODEL_T_MALL_ATTR;
import com.lv.bean.OBJECT_T_MALL_ATTR;
import com.lv.mapper.AttrMapper;

@Service
public class AttrServiceImpl implements AttrService {
	@Autowired
	private AttrMapper attrMapper;

	@Override
	public void saveAttr(int flbh2, List<OBJECT_T_MALL_ATTR> list_attr) {
		for (int i =0 ; i < list_attr.size(); i++) {
			//插入属性，返回主键
			OBJECT_T_MALL_ATTR attr = list_attr.get(i);
			attrMapper.insertAttr(flbh2,attr);
			
			//获取返回主键批量插入属性值
			attrMapper.insertValues(attr.getId(),attr.getList_value());
			
		}
		
	}

	@Override
	public List<OBJECT_T_MALL_ATTR> get_attr_list(int flbh2) {
		// TODO Auto-generated method stub
		List<OBJECT_T_MALL_ATTR> list_attr= attrMapper.select_attr_list(flbh2);
		return list_attr;
	}


}
