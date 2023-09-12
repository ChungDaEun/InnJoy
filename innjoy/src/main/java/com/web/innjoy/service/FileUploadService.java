package com.web.innjoy.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.innjoy.model.Board_Img;
import com.web.innjoy.model.Pro_Img;
import com.web.innjoy.model.Review;
import com.web.innjoy.model.Review_Img;
import com.web.innjoy.repository.ProImgRepository;
import com.web.innjoy.repository.RecommImgRepository;
import com.web.innjoy.repository.RecommRepository;
import com.web.innjoy.repository.ReviewImgRepository;

@Service
public class FileUploadService {

	@Autowired
	private ReviewImgRepository rImgRepository;
	@Autowired
	private RecommImgRepository recImgRepository;
	@Autowired
	private ProImgRepository pImgRepository;
	
	@Value("${upload}")
	private String path;
	
	// 리뷰 이미지 업로드
	public String uploadReviewFile(List<MultipartFile> mfs, int reviewId) {
		String msg="업로드 성공";
		//  파일객체 만들기
		for(MultipartFile mf : mfs) {
			String fname = mf.getOriginalFilename();
			File upFile = new File(path + fname);
			// 파일 객체 생성해서 DB에 저장
			Review_Img rImg = new Review_Img(fname,reviewId);
			rImgRepository.save(rImg);
			System.out.println("reviewId : " + reviewId);
			try {
				// 실제 파일이 생성됨
				mf.transferTo(upFile);
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			} catch (IOException e) {
				System.out.println("#파일업로드에러발생#");
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			}
		}
		return msg;
	}
	
	// 리뷰 이미지 수정
	public void updateReviewFile(List<MultipartFile> mfs, int reviewId) {
		List<Review_Img> origins = rImgRepository.findByReviewId(reviewId);	// 해당 리뷰 이미지리스트
		for(MultipartFile ri : mfs) {
			System.out.println("mfs fname: " + ri.getOriginalFilename());
		}
		if(mfs.size()==1&& mfs.get(0).getOriginalFilename().equals("")){	// 첨부한 이미지가 없다면
			System.out.println("reviewId: " +reviewId+"\n첨부파일 없음");
		}else if(origins.isEmpty()) {	// list가 비어있다면 (기존 업로드 된 이미지 없을 시)
			System.out.println("reviewId: " +reviewId+"\nReviewImg isEmpty: UploadReviewFile 실행.");
			uploadReviewFile(mfs, reviewId);		// uploadReviewFile 메서드 실행
		}else{	// 기존 업로드 된 이미지가 있을 시
			System.out.println("reviewId: " +reviewId+"\nReviewImg notEmpty: deleteById 실행.");
			rImgRepository.deleteByReviewId(reviewId);	// 해당 리뷰의 이미지 삭제하고
			System.out.println("reviewId: " +reviewId+"\nUploadReviewFile 실행.");
			uploadReviewFile(mfs, reviewId);		// uploadReviewFile 메서드 실행
		}
	}
	
	// 게시물 이미지 업로드
	public String uploadRcomFile(List<MultipartFile> mfs, int recommId) {
		String msg="업로드 성공";
		//  파일객체 만들기
		for(MultipartFile mf : mfs) {
			String fname = mf.getOriginalFilename();
			File upFile = new File(path + fname);
			// 파일 객체 생성해서 DB에 저장
			Board_Img bImg = new Board_Img(fname,recommId);
			recImgRepository.save(bImg);
			System.out.println("recommId : " + recommId);
			try {
				// 실제 파일이 생성됨
				mf.transferTo(upFile);
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			} catch (IOException e) {
				System.out.println("#파일업로드에러발생#");
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			}
		}
		return msg;
	}
	// 게시물 이미지 수정
	public void updateRecommFile(List<MultipartFile> mfs, int recommId) {
		List<Board_Img> origins = recImgRepository.findByRecomId(recommId);	// 해당 게시물 이미지리스트
		if(mfs.size()==1&& mfs.get(0).getOriginalFilename().equals("")){	// 첨부한 이미지가 없다면
			System.out.println("recommId: " +recommId+"\n첨부파일 없음");
		}else if(origins.isEmpty()) {	// list가 비어있다면 (기존 업로드 된 이미지 없을 시)
			System.out.println("recommId: " +recommId+"\nRecommImg isEmpty: UploadReviewFile 실행.");
			uploadRcomFile(mfs, recommId);		// uploadRcomFile 메서드 실행
		}else{	// 기존 업로드 된 이미지가 있을 시
			System.out.println("recommId: " +recommId+"\nRecommImg notEmpty: deleteById 실행.");
			recImgRepository.deleteByRecomId(recommId);	// 해당 게시물의 이미지 삭제하고
			System.out.println("recommId: " +recommId+"\nUploadReviewFile 실행.");
			uploadRcomFile(mfs, recommId);		// uploadRcomFile 메서드 실행
		}
	}
	
	// 상품 이미지 업로드
	public String uploadProFile(List<MultipartFile> mfs, int proId) {
		String msg="업로드 성공";
		//  파일객체 만들기
		for(MultipartFile mf : mfs) {
			String fname = mf.getOriginalFilename();
			File upFile = new File(path + fname);
			// 파일 객체 생성해서 DB에 저장
			Pro_Img pImg = new Pro_Img(fname,proId);
			pImgRepository.save(pImg);
			System.out.println("reviewId : " + proId);
			try {
				// 실제 파일이 생성됨
				mf.transferTo(upFile);
			} catch (IllegalStateException e) {
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			} catch (IOException e) {
				System.out.println("#파일업로드에러발생#");
				System.out.println(e.getMessage());
				msg="업로드 에러:"+e.getMessage()+"\n";
			}
		}
		return msg;
	}
	
	// 게시물 이미지 수정
}
