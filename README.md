# MemoApp
# 
## 기간
2021. 11.08 ~ 12 ( 18:00 까지 )
# 
## 구현
### - 처음 페이지와 두번째 페이지에 TableView를 둔 상태입니다.
### - searchBar는 위로 올려보면 나옵니당
### - 두번째 페이지 TableView에서 하나의 nib파일로 cell을 재사용하는 형태로 구현하고자 했습니다
# 
## 과제 미해결 & 오류
### 1. searchBar...
### 2. 두번째 페이지에서 row 0번과 row 1번을 구분하여 처리하고자 했는데 너무 비효율적인 거 같습니다 tableView를 reload해주기 위해서 textView endEditing으로 해줬는데 textView 작성 후 다른 부분을 클릭해줘야 정상적으로 처리합니다 
### 3. 두번째 페이지에서 뒤로 가기 버튼을 눌렀을 때 저장 부분에서 오류가 있습니다 
### - 처음에는 메모 작성하는 버튼을 누르고 저장하는 부분을 구현하고자 했습니다 처음 UI 구성부터 잘못되어서 그런지 cell내부에 있는 TextView 값을 ViewController로 전달 받지 못했습니다 그래서 delegate를 이용해서 값 전달을 해준 상태입니다
### - 첫번째 페이지 TableView에서 선택하여 메모 작성 페이지로 넘어갈 때 cell 내부 TextView에 값 전달하고 저장하는 부분에 오류가 있어서 분기처리해줬습니다
### - 키보드 엔터를 누르면 다음 셀의 TextView로 넘어가는 부분도 구현하지 못하였습니다
### ( 초기 구현을 잘못하니 점점 산으로 간 거 같고 되돌아 가기엔 과제 기간이 얼마 남지 않아서 정말 혼돈...)
# 
## 과제 해결법
### - label을 두고 클릭하면 실시간으로 수정을 할 수도 있지 않을까 합니다
### - autoDemension을 이용하기 위해서 tableView를 사용했는데 nib을 설정 할 때부터 textView를 두개를 만들어서 구현하면 되지 않을까 합니다
# 
## 시뮬레이터 화면
### 주말에 다시 다 뜯어봐야겠어요...
<img src="https://user-images.githubusercontent.com/80211277/141400605-2c1e4caa-990c-43a1-8dbd-c9cac3609c09.gif" width="300">
<img src="https://user-images.githubusercontent.com/80211277/141400610-f08c8097-b769-4cdd-8341-ddee6e18ab79.gif" width="300">
