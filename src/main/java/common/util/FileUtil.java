package common.util;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import common.exception.FileException;

public class FileUtil {

	public List<Map<String, Object>> fileUpload(List<MultipartFile> files, String path) throws FileException {
		
		// 파일 관련 정보를 반환할 list 생성
		List<Map<String, Object>> fileData = new ArrayList<Map<String,Object>>();
		
		// rename에 사용할 index
		int idx = 0;
		
		for (MultipartFile mf : files) {

			// 사용자가 올린 파일 이름
			String ofn = mf.getOriginalFilename();
			int pos = ofn.lastIndexOf(".");
			String originFileName = ofn.substring(0, pos);
			
			// 서버에 저장될 파일 이름
			String renameFileName = getRenameFileName(originFileName, idx);
			
			// 확장자
			String ext = ofn.substring(ofn.lastIndexOf(".") + 1);
			
			// 파일 사이즈
			int s = (int) mf.getSize();
			String size = Integer.toString(s);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("origin", originFileName);
			map.put("rename", renameFileName);
			map.put("ext", ext);
			map.put("sizes", size);
			
			// tb_file에 저장할 데이터를 list에 추가
			fileData.add(map);
			
			// 저장 경로
			String loc = path + "/" + renameFileName + "." + ext;

			// 사용자가 등록한 파일을 설정한 경로에 저장
			saveFile(mf, loc);
			
			idx++;
		}
		
		return fileData;
	}
	
	public String getRenameFileName(String originFileName, int idx) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ idx;
		
		return renameFileName;
	}
	
	public void saveFile(MultipartFile mf, String savePath) throws FileException {
		
		// 사용자가 등록한 파일을 옮겨담을 파일 객체 생성
		// savePath : 저장할 경로 + 변경된 파일명
		System.out.println(savePath);
		File fileData = new File(savePath);
		
		try {
			// 에러 테스트 코드
		//	int err = 10/0;
			mf.transferTo(fileData);
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
		} catch (Exception e) {
			e.printStackTrace();
			throw new FileException("F_ERROR_02");
		}
	}
	
	public void deleteFile(String path) {
		
		// 지정된 경로의 파일 객체를 생성
		File file = new File(path);
		
		// delete() 메서드로 파일을 삭제
		file.delete();
	}
	
}
