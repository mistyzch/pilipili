package com.pilipili.common.util;

import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.FrameGrabber;
import org.bytedeco.javacv.Java2DFrameConverter;
import org.junit.Test;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * @author: ABKing
 * @Date: 2019/12/28 13:35
 * @Description:
 **/
public class GetVideoLengthAndPic {
    public static long getVideoDuration(File video) {
        long duration = 0L;
        FFmpegFrameGrabber ff = new FFmpegFrameGrabber(video);
        try {
            ff.start();
            duration = ff.getLengthInTime() / (1000 * 1000);
            ff.stop();
        } catch (FrameGrabber.Exception e) {
            e.printStackTrace();
        }
        return duration;
    }
    public static void getVideoPic(File video, String picPath) {
        FFmpegFrameGrabber ff = new FFmpegFrameGrabber(video);
        try {
            ff.start();

            // 截取中间帧图片(具体依实际情况而定)
            int i = 0;
            int length = ff.getLengthInFrames();
            int middleFrame = length / 2;
            Frame frame = null;
            while (i < length) {
                frame = ff.grabFrame();
                if ((i > middleFrame) && (frame.image != null)) {
                    break;
                }
                i++;
            }

            // 截取的帧图片
            Java2DFrameConverter converter = new Java2DFrameConverter();
            BufferedImage srcImage = converter.getBufferedImage(frame);
            int srcImageWidth = srcImage.getWidth();
            int srcImageHeight = srcImage.getHeight();

            // 对截图进行等比例缩放(缩略图)
            int width = 480;
            int height = (int) (((double) width / srcImageWidth) * srcImageHeight);
            BufferedImage thumbnailImage = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
            thumbnailImage.getGraphics().drawImage(srcImage.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);

            File picFile = new File(picPath);
            ImageIO.write(thumbnailImage, "jpg", picFile);

            ff.stop();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Test
    public void testGetVideoDuration(){
        File file = new File("D:\\source\\videos\\ghost\\0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4");
        long second = getVideoDuration(file);
        System.out.println("共" + second + "秒");
        System.out.println(second/60 + "分" + second%60 + "秒");
    }
    @Test
    public void testGetVideoPic(){
        File file = new File("D:\\source\\videos\\ghost\\0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4");
        String picPath = "D:\\source\\videos\\ghost\\1.jpg";
        getVideoPic(file, picPath);
    }
}
