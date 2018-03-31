package com.lv.mapper;

import java.util.List;
import java.util.Map;

import com.lv.bean.OBJECT_T_MALL_ATTR;
import com.lv.bean.T_MALL_SKU;

public interface SkuMapper {

	void insert_sku(T_MALL_SKU sku);

	void inset_sku_av(Map<Object, Object> map);

}
