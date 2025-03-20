import { HomePage } from "home";
import { LivePage } from "live";
import { MinePage } from "mine";

class MainTabModel {
  index: number = 0;
  normalImg: Resource =$r('app.media.new_home_tabbar_Normal');
  selectImg: Resource =$r('app.media.new_home_tabbar_press_Normal');
  whiteImg: Resource =$r('app.media.new_refresh_tabbar_press_Normal');
  title: Resource =$r('app.string.home');
}
const MAIN_TAB_LIST: MainTabModel[] = [
  {
    index: 0,
    normalImg: $r('app.media.new_home_tabbar_Normal'),
    selectImg: $r('app.media.new_home_tabbar_press_Normal'),
    whiteImg: $r('app.media.pseries_logo_Normal'),
    title: $r('app.string.home')
  },
  {
    index: 1,
    normalImg: $r('app.media.new_video_tabbar_Normal'),
    selectImg: $r('app.media.new_video_tabbar_press_Normal'),
    whiteImg: $r('app.media.new_refresh_tabbar_press_Normal'),
    title: $r('app.string.video')
  },
  {
    index: 2,
    normalImg: $r('app.media.mall_tabbar_Normal'),
    selectImg: $r('app.media.mall_tabbar_press_Normal'),
    whiteImg: $r('app.media.lmcv_v2a_timer_Normal'),
    title: $r('app.string.shop')
  },
  {
    index: 3,
    normalImg: $r('app.media.new_mine_tabbar_Normal'),
    selectImg: $r('app.media.new_mine_tabbar_press_Normal'),
    whiteImg: $r('app.media.ic_search_White_online_Normal'),
    title: $r('app.string.mine')
  }
]

// @Preview
@Entry
@Component
struct MainPage {
  @State CurSel: number = 0;

  build() {
    Column() {
      Tabs({barPosition: BarPosition.End}) {

        ForEach(MAIN_TAB_LIST, (item: MainTabModel, index: number)=>{

          TabContent(){
            if (index === 0) {
              //首页
              HomePage()
            } else if (index === 1) {
              //直播
              LivePage()
            } else if (index === 2) {
              //搜索
            } else if (index == 4) {
              //社区
            } else if (index === 5) {
              //我的
              MinePage()
            }
          }.tabBar(this.BottomTabItemView(item))

        })

      }//Tabs
      .barWidth('100%')
      .barHeight(56)
      .scrollable(false)
      .onChange((index: number)=>{
        this.CurSel = index;
      })

    }//Column
    .height('100%')
    .width('100%')
    .backgroundColor(this.CurSel === 1 ? Color.Black : Color.White)

  }

  @Builder
  BottomTabItemView(item: MainTabModel) {

  }
}