package com.web.innjoy.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.innjoy.dto.CommDto;
import com.web.innjoy.dto.RecommDto;
import com.web.innjoy.dto.ReviewDto;
import com.web.innjoy.model.Recomm;
import com.web.innjoy.model.Recomm_comm;
import com.web.innjoy.model.Review;
import com.web.innjoy.repository.RecommRepository;
import com.web.innjoy.repository.Recomm_CommRepository;
import com.web.innjoy.repository.ReviewRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class BoardService {

   @Autowired
   private ReviewRepository revRepository;
   @Autowired
   private RecommRepository recommRepository;
   @Autowired
   private Recomm_CommRepository commRepository;
   
   // 리뷰 작성 여부 확인
   public String ckReview(int resId) {
      String rs ="";
      int check = revRepository.ckReview(resId);
      if(check > 0) {   // 작성된 리뷰 있을 시
         rs = "true";      
      }else {
         rs ="false";
      }
      return rs;
   }
   
   // 리뷰 조회
   public ReviewDto reviewDetail(int reviewId) {
      System.out.println("service reviewId: "+reviewId);
      Review rev = revRepository.findById(reviewId)
                .orElseThrow(() -> new EntityNotFoundException("리뷰 찾기 실패"));
      ReviewDto revDto = new ReviewDto (
            rev.getReviewId(),
            rev.getReservationId(),
            rev.getReservation().getRoom().getProduct().getProName(),
            rev.getReservation().getRoom().getRoomName(),
            rev.getReservation().getStartDt(),
            rev.getReservation().getEndDt(),
            rev.getStar(),
            rev.getReviewDet()
            );
      return revDto;
   }
   // 리뷰 작성
   public Review writeReview(Review review) {
      return revRepository.save(review);
   }
   // 리뷰 삭제
   public void deleteReview(int reviewId) {
      revRepository.deleteById(reviewId);
   }
   // 리뷰 수정
    public void updateReview(Review review) {
       System.out.println(review.getReviewId());
       System.out.println(review.getReservationId());
       Review rev = revRepository.findById(review.getReviewId()).orElseThrow(() -> {
            return new IllegalArgumentException("리뷰 찾기 실패");
        });
       rev.setStar(review.getStar());
       rev.setReviewDet(review.getReviewDet());
       revRepository.save(rev);
    }
    // 게시물 조회
    public RecommDto recommDetail(int recommId) {
       System.out.println("service recommId: "+recommId);
       Recomm rec = recommRepository.findById(recommId)
        .orElseThrow(() -> new EntityNotFoundException("게시물 찾기 실패"));
       RecommDto recDto = new RecommDto(
             rec.getReservation().getRoom().getProduct().getProName(),
             rec.getRecomId(),
             rec.getTitle(),
             rec.getDetail(),
             rec.getRecomLoc(),
             rec.getRecommType(),
             rec.getRecomTime(),
             rec.getLatitude(),
             rec.getLongitude(),
             rec.getReservation().getReservationId()
             );
       return recDto;
    }
   // 게시물 작성
   public Recomm writeRecomm(Recomm recomm) {
      return recommRepository.save(recomm);
   }
   // 게시물 삭제
   public void deleteRecomm(int recommId) {
      recommRepository.deleteById(recommId);
   }
   // 게시물 수정
    public void updateRecomm(Recomm recomm) {
       System.out.println(recomm.getRecomId());
       System.out.println(recomm.getReservationId());
       Recomm rec = recommRepository.findById(recomm.getRecomId()).orElseThrow(() -> {
            return new IllegalArgumentException("게시물 찾기 실패");
        });
       rec.setTitle(recomm.getTitle());
       rec.setDetail(recomm.getDetail());
       rec.setRecomLoc(recomm.getRecomLoc());
       rec.setRecommType(recomm.getRecommType());
       rec.setLatitude(recomm.getLatitude());
       rec.setLongitude(recomm.getLongitude());
       recommRepository.save(rec);
    }
    
   // 댓글 작성
   public Recomm_comm writeComm(CommDto commDto) {
      Recomm_comm comm = new Recomm_comm(
            commDto.getRecomId(),
            commDto.getUserId(),
            commDto.getRcComDet()
            );
      return commRepository.save(comm);
   }
   // 댓글리스트 조회
   public List<CommDto> getCommList(int recommId){
      List<Recomm_comm> commList = commRepository.findByRecomId(recommId);
      // 게시물 아이디로 가져온 댓글 리스트를
      List<CommDto> dtoList = new ArrayList<CommDto>();
      for(Recomm_comm comm : commList) {
         CommDto dto = new CommDto(
               comm.getRecomId(),
               comm.getRecomId(),
               comm.getUserId(),
               comm.getRcComDet(),
               comm.getRcComTime()
               );
         dtoList.add(dto);   // dto에 차례로 저장
      }
      
      return dtoList;
   }
   
   // 댓글 삭제
   public void deleteComm(int commId) {
      commRepository.deleteById(commId);
   }
}