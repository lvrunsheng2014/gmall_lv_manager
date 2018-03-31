package com.lv.service;

import java.util.List;

import com.lv.bean.T_MALL_PRODUCT;

public interface SpuService {
	public void insertSpu(T_MALL_PRODUCT spu, List<String> upload_image);

	public List<T_MALL_PRODUCT> get_spu_list(int pp_id, int flbh2);

	//public void insertSpu(String shp_mch, String shp_msh);
}
