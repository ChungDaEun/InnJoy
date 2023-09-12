    const slider = document.querySelector('.slider');
    const leftArrow = document.querySelector('.left');
    const rightArrow = document.querySelector('.right');
    let slideIndex = 0;

    // 좌우 화살표 버튼 클릭 이벤트 처리
    leftArrow.addEventListener('click', () => {
      if (slideIndex === 0) {
        slideIndex = slider.children.length - 1;
      } else {
        slideIndex--;
      }
      updateSlider();
    });

    rightArrow.addEventListener('click', () => {
      if (slideIndex === slider.children.length - 1) {
        slideIndex = 0;
      } else {
        slideIndex++;
      }
      updateSlider();
    });

    // 슬라이더 업데이트 함수
    function updateSlider() {
      slider.style.transform = `translateX(-${slideIndex * 100}%)`;
    }
 


 