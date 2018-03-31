package com.lv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lv.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.lv.bean.OBJECT_T_MALL_ATTR;
import com.lv.bean.T_MALL_PRODUCT;
import com.lv.bean.T_MALL_SKU;
import com.lv.bean.T_MALL_SKU_ATTR_VALUE;
import com.lv.service.AttrService;
import com.lv.service.SkuService;

@Controller
public class SkuController {
	@Autowired
	private SkuService skuService;
	
	@Autowired
	private AttrService attrService;
	@RequestMapping("goto_sku_add")
	public String goto_sku_add(int flbh1,int flbh2,ModelMap map) {
		List<OBJECT_T_MALL_ATTR> list_attr = attrService.get_attr_list(flbh2);
		map.put("flbh1", flbh1);
		map.put("flbh2", flbh2);
		map.put("list_attr", list_attr);
		return "skuAdd";
	}
	
	@RequestMapping("save_sku")
	public ModelAndView save_sku(T_MALL_SKU sku,MODEL_T_MALL_SKU_ATTR_VALUE list_attr,T_MALL_PRODUCT spu,ModelMap map) {
		
		skuService.save_sku(sku,spu,list_attr.getList_attr());
		ModelAndView mv = new ModelAndView("redirect:/index.do");
	/*	mv.addObject("flbh1", spu.getFlbh1());
		mv.addObject("flbh2", spu.getFlbh2());*/
		mv.addObject("url","goto_sku_add.do?flbh1="+spu.getFlbh1()+"&flbh2="+ spu.getFlbh2());
		mv.addObject("title", "添加库存单元属性");
		return mv;
	}
}
