
-- 저널게시판 board DB
select * from board;

update board set del = 'n';

INSERT INTO BOARD VALUES (1,'열대야에 어울리는 시원한 여름 힐링 영화 <맘마미아>','여름 힐링 영화라면 절대 빼놓을 수 없는 영화. OST가 정말 너무너무 좋다보니, 뮤지컬을 좋아하지 않는 분들이라도 이 영화를 한 번 보고 나면 OST를 무한 반복 재생할 것이라 확신할 수 있을 정도.
''도나''와 친구들의 우정, ''도나''와 그의 딸 ''소피''의 가족애까지 뭐 하나 빼놓을 것 없는 영화. 시원한 그리스 섬이 배경이다 보니 어디로든 떠나고 싶긴 한데 움직이는 것 조차 귀찮을 때 보면 딱 좋다.',0,'1.JPG','N');
INSERT INTO BOARD VALUES (2,'<요노스케 이야기> 평범했지만 웃음이 나오는 이야기','요즘 만나는 사람들에게 꼭 한번씩 추천하는 영화, 별 거 아닌 이야긴데 잔상이 오래 남는 영화, 두 번을 160분의 러닝타임을 쉬지 않고 몰입해서 본 영화, <요노스케 이야기>. 우리는 조금 먼 미래, 어떻게 살아가는지도 모르는 옛 친구에게 어떻게 기억될까?
나를 떠올렸을 때, 나에 대해 엄청난 칭찬은 아니더라도, ''그때 그랬었는데'' 하고 피식 웃어준다면 그것으로 괜찮은 인생이 아닐까.',0,'2.jpg','N');
INSERT INTO BOARD VALUES (3,'8살 소녀가 받아들인 이별이야기 <역으로 가는 길을 알려줘>','<역으로 가는 길을 알려줘> 또한 기차 건널목에서 시작하는 영화다. 여덟 살의 소녀 사야카(니쓰 지세)는 그곳을 지나가다 문득 반년 전의 기억을 생각한다. 반려견이었던 루와 함께 이곳을 걸었던 사야카. 조금 더 시간을 거슬러 올라가, 1년 전에 사야카는 작은 동물들을 분양하는 펫샵 앞에서도 거의 버려지다시피 한 강아지 루를 발견했다. 데려가는 사람이 없으면 가게 사장이 이 아이를 곧 내쫓을 거라는 이야기를 들은 사야카는 부모님을 졸라 루를 자신의 집으로 데려오는 데 성공한다. 사야카는 학교에서는 친구 없이 은근한 따돌림을 당하지만, 루와 함께면 어디든 자유롭게 돌아다닐 수 있어 전혀 외롭지 않다.',
0,'3.jpg','N');
INSERT INTO BOARD VALUES (4,'타인의 인생영화 명작 <미스 리틀 선샤인>','사랑스러운 막내 딸의 꿈인 미인대회 참가는 도저히 섞이지 않을 것 같은 가족들을 모여서 도전하고 용기를 얻고 시도를 하는 행복한 여정에 이르게 한다. 결과가 어찌됐든 중요하지 않다.
극 중의 외삼촌의 대사처럼, ''인생을 되돌아보면, 고민하고 실패하면서 철저히 고통받았던 날들이 인생 자기 인생의 최고의 날들이었다고, 지금의 나를 만들어냈던 시간이었다고.'' 올리브의 가족 또한 그리고 고통스럽고 치열한 각각의 구성원들에게 1박2일의 여정이 인생 최고의 행복한 순간으로 기억되지 않을까 싶다.',0,'4.jpg','N');
INSERT INTO BOARD VALUES (5,'단편영화 리뷰<열대야>','<열대야>의 엔딩은 상식의 사과를 하지 못하는 버릇과 더불어 그의 삶에 어떤 변화가 있을 것이라는 여지를 남긴다. 살아감에 있어서 어떤 관계는 원하는 대로만 흘러가지 않고, 모든 목표들을 이루며 살 수는 없다. 다만 그 자리에서 무언가를 깨닫고, 할 수 있는 것들을 하면서 살아갈 뿐.',0,'5.jpg','N');
INSERT INTO BOARD VALUES (6,'시대에게 꿈을 빼앗긴 청춘들의 방황과 성장 <스물다섯 스물하나>','1998년, 시대에게 꿈을 빼앗긴 청춘들의 방황과 성장을 그린 청량 청춘 케미스트리!
나희도의 유언 : 오늘은 1999년 12월 30일, 내일이면 지구가 멸망한다는 헛소리를 믿는 건 아니다. 열아홉은 그 정도로 순진한 나이가 아니다. 알 거 다 아는 나이지. 그래도 혹시 몰라 적는다. 좀 살아보니 인생은 혹시 모르는 일들이 폭죽처럼 팡팡 터진다.
백이지의 유언 : 내일이면 지구가 멸망한다고 절절하게 믿고 있는 동생이 강요해서 쓴다. 사람들은 믿고 싶은 걸 믿는다는데, 동생은 지구가 멸망하길 바라는 걸까? 그럴 수도 있을 것 같다. 집안은 풍비박산 났고, 가족들은 뿔뿔이 흩어졌다. 유복하고 귀여웠던 우리 막내는 한순간 낯선 친척 집 다락방 신세가 됐다.',0,'6.jpg','N');