package com.lv.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lv.bean.T_MALL_PRODUCT;
import com.lv.service.SpuService;
import com.lv.util.MyFileUpload;


@Controller
public class SpuController {
	@Autowired
	private SpuService spuService;
	@RequestMapping("goto_spu_add")
	public String goto_spu_add(ModelMap map,T_MALL_PRODUCT spu) {
		map.put("spu", spu);
		return "spuAdd";
	}
	
	@RequestMapping("spu_add")
	public ModelAndView spu_add(T_MALL_PRODUCT spu,@RequestParam("files") MultipartFile[] files) throws IllegalStateException, IOException  {
			
		/*List<String> upload_image = MyFileUpload.upload_image(files);

		spuService.insertSpu(spu, upload_image);
		ModelAndView mv = new ModelAndView("redirect:/goto_spu_add.do");
		mv.addObject("flbh1", spu.getFlbh1());
		mv.addObject("flbh2", spu.getFlbh2());
		mv.addObject("pp_id", spu.getPp_id());
		return mv;*/
		List<String> upload_image = MyFileUpload.upload_image(files);

		spuService.insertSpu(spu, upload_image);
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		
		
		mv.addObject("url", "goto_spu_add.do?flbh1="+spu.getFlbh1()+"&flbh2="+spu.getFlbh2()+"&pp_id="+spu.getPp_id());
		mv.addObject("title", "商品信息添加");
		return mv;
		
	}
	@ResponseBody
	@RequestMapping("get_spu_list")
	public List<T_MALL_PRODUCT> get_spu_list(int pp_id,int flbh2) {
		List<T_MALL_PRODUCT> list_spu=spuService.get_spu_list(pp_id,flbh2);
		return list_spu;
	}
}
