package com.oasys.controller;

import com.oasys.entity.ImgPath;
import com.oasys.service.ImgPathService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

@Controller
public class ImgPathController {
    @Autowired
    private ImgPathService imgPathService;



    @PostMapping("/imgUpd")
    @ResponseBody
    public String imgUpd(String base64, Integer eid, HttpServletRequest request) {
        System.out.println(base64);
        String fileName = "";
        boolean b = false;
        if (base64 == null) {
            return "生成文件失败，未传入参数!";
        }
        // 判断是否base64是否包含data:image/png;base64等前缀，如果有则去除
        if (base64.contains("data:image/png;base64")) {
            base64 = base64.substring(22);
            fileName = System.currentTimeMillis() + ".png";
            System.out.println("包含png" + base64);
        }
        if (base64.contains("data:image/jpeg;base64")) {
            base64 = base64.substring(23);

            System.out.println("包含jpeg" + base64);
        }
        if (base64.contains("data:application/pdf;base64")) {
            base64 = base64.substring(28);
            fileName = System.currentTimeMillis() + ".pdf";
            System.out.println("包含pdf" + base64);
        }
        if (base64.contains("data:image/gif;base64")) {
            base64 = base64.substring(22);
            fileName = System.currentTimeMillis() + ".gif";
            System.out.println("包含gif" + base64);
        }
        if (fileName == "") {
            fileName = System.currentTimeMillis() + ".jpg";
        }
        String filePath = "C:\\Users\\温情\\Desktop\\shixun\\OA\\src\\main\\webapp\\static\\img\\" + fileName;
        String imgPath = "/img/" + fileName;
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] bytes = new byte[0];
        try {
            bytes = decoder.decodeBuffer(base64);
        } catch (IOException e) {
            e.printStackTrace();
        }
        for (int i = 0; i < bytes.length; ++i) {
            // 调整异常数据
            if (bytes[i] < 0) {
                bytes[i] += 256;
            }
        }
        OutputStream outputStream = null;
        InputStream inputStream = new ByteArrayInputStream(bytes);
        // 此处判断文件夹是否存在，不存在则创建除文件外的父级文件夹
        File file = new File(filePath);
        if (!file.exists()) {
            System.out.println("上级目录" + file.getParentFile());
            file.getParentFile().mkdirs();
        }
        try {
            // 生成指定格式文件
            outputStream = new FileOutputStream(filePath);
            byte[] buff = new byte[1024];
            int len = 0;
            while ((len = inputStream.read(buff)) != -1) {
                outputStream.write(buff, 0, len);
            }
            b = true;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        ImgPath img = null;
        if (b) {
            /**
             * 修改员工头像
             */
            imgPathService.updImgPath(eid, imgPath);
            /**
             * 查询员工头像路径
             */
            img = imgPathService.queryById(eid);
            request.getSession().setAttribute("imgPath", img);
        }
        return img != null ? "修改成功" : "修改失败";
    }
}
