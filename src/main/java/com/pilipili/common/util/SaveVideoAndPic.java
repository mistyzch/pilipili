package com.pilipili.common.util;

import org.apache.commons.fileupload.util.Streams;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: ABKing
 * @Date: 2019/12/28 15:01
 * @Description:
 **/
public class SaveVideoAndPic {
    public static Map<String, String> saveVideo(HttpServletRequest request, MultipartFile file) throws IOException {
        String categroyType = request.getParameter("type");
        String tempFilename = file.getOriginalFilename();// 获得文件名
        String[] f = tempFilename.split("\\.");
//        String src_path = request.getServletContext().getRealPath("/");
//        String disk = src_path.substring(0, src_path.indexOf(":") + 1);//获取盘符
        String disk = "E:";
        String path = disk + "/source/videos/" + categroyType + "/";
        String filename = f[0] + "-" + new Date().getTime() + "." + f[f.length - 1];
        Streams.copy(file.getInputStream(),new FileOutputStream(path + filename),true);
        Map<String, String> map = new HashMap<>();
        map.put("tempFilename", tempFilename);
        map.put("path", path);
        map.put("filename", filename);
        map.put("categroyType", categroyType);
        map.put("disk", disk);
        map.put("title", request.getParameter("title"));
        map.put("desc", request.getParameter("desc"));

        return map;
    }
    public static String SavePic(Map<String, String> map){
        String disk = map.get("disk");
        String path = map.get("path");
        String categroyType = map.get("categroyType");
        String filename = map.get("filename");

        File readFile = new File(path + filename);
        String picUrl = disk + "/source/images/cover/" + categroyType + "/" + filename.split("\\.")[0] + ".jpg";
        GetVideoLengthAndPic.getVideoPic(readFile, picUrl);
        String pictureUrls = "/imgs/cover/" + categroyType + "/" + filename.split("\\.")[0] + ".jpg";
        //media.setPictureUrls(pictureUrls);
        return pictureUrls;
    }
    public static Date getVideoLength(Map<String, String> map) throws ParseException {
        String path = map.get("path");
        String filename = map.get("filename");
        File readFile = new File(path + filename);

        long result = GetVideoLengthAndPic.getVideoDuration(readFile);
        String videoLength = result / 60 / 60 + ":" + result / 60 + ":" + result % 60;
        Date strDate = new SimpleDateFormat("HH:mm:ss").parse(videoLength);
        return strDate;
    }
}
