package com.lv.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lv.bean.T_MALL_PRODUCT;
import com.lv.mapper.SpuMapper;

@Service
public class SpuServiceImpl implements SpuService{
	@Autowired
	private SpuMapper supMapper;
	@Override
	public void insertSpu(T_MALL_PRODUCT spu, List<String> upload_image) {
		// TODO Auto-generated method stub
		spu.setShp_tp(upload_image.get(0));
		supMapper.insertSpu(spu);
		
		//批量插图图片信息
		Map<Object, Object> map=new HashMap<Object, Object>();
		map.put("shp_id", spu.getId());
		map.put("upload_image", upload_image);
		supMapper.insertSpuImg(map);
	}
	@Override
	public List<T_MALL_PRODUCT> get_spu_list(int pp_id, int flbh2) {
		// TODO Auto-generated method stub
		Map<Object, Object> map=new HashMap<Object, Object>();
		map.put("pp_id", pp_id);
		map.put("flbh2", flbh2);
		List<T_MALL_PRODUCT> list_spu=supMapper.select_Spu_list(map);
		return list_spu;
	}
	

}
