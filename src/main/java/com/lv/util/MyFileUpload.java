package com.lv.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class MyFileUpload {

	public static List<String> upload_image(MultipartFile[] files) {
	String path=MyPropertyUtil.getProperty("myUpload.properties","windows_path");
	List<String> img_upload=new ArrayList<String>();
		for (int i = 0; i < files.length; i++) {
			if(!files[i].isEmpty()) {
				
				String originalFilename = files[i].getOriginalFilename();
				String name=System.currentTimeMillis()+originalFilename;
				String uploda=path+"/"+name;
				try {
					files[i].transferTo(new File(uploda));
					img_upload.add(name);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		/*//上传图片
		List<String> list_image=MyFileUpload.upload_image(files);
		String fileName = files.getOriginalFilename();
		String uuidFileName=UUID.randomUUID().toString();
		String suffix=fileName.substring(fileName.lastIndexOf("."));
		File destFile=new File("F:\\resources\\img\\cert\\"+uuidFileName+suffix);
			files.transferTo(destFile);
			spu.setShp_tp(uuidFileName+suffix);	*/
		return img_upload;
	}

}
