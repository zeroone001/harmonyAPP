import { ArticleClass } from '../model/ArticleClass';
import { webview } from '@kit.ArkWeb';
import { emitter } from '@kit.BasicServicesKit';
import { Speaker } from '@ohos/utils';

@Component
struct WebComponent {
  @Prop articleDetail: ArticleClass | null;
  private webviewController: webview.WebviewController = new webview.WebviewController();

  build(){
    Column() {
      Text('测试一下')
      // Web({ src: this.articleDetail?.webUrl, controller: this.webviewController })
      //   .darkMode(WebDarkMode.Auto)
      //   .domStorageAccess(true)
      //   .zoomAccess(true)
      //   .fileAccess(true)
      //   .mixedMode(MixedMode.All)
      //   .cacheMode(CacheMode.None)
      //   .javaScriptAccess(true)
      //   .width('100%')
      //   .layoutWeight(1)
    }
  }
}

@Component
export struct ArticleDetailPage {
  @State articleDetail: ArticleClass | null = null;
  @Consume('articlePathStack') articlePathStack: NavPathStack;
  @State isClicked: boolean = false;
  speaker: Speaker = new Speaker();

  aboutToAppear(): void {
    this.articleDetail = this.articlePathStack.getParamByName('articleDetail')[0] as ArticleClass;
    emitter.on("eventId", () => {
      this.isClicked = false;
    });
  }

  aboutToDisappear(): void {
    this.speaker?.shutdownEngine();
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          Row() {
            Image($r('app.media.ic_back'))
              .width(40)
              .height(40)
              .onClick(() => {
                // 返回上一页
                this.articlePathStack.pop()
              })
            Row() {
              Text(this.articleDetail?.title)
                .fontFamily('HarmonyHeiTi-Bold')
                .fontSize(20)
                .textAlign(TextAlign.Start)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
                .fontWeight(700)
                .margin({ left: 8 })
            }
            .width('80%')
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('100%')
          .height(56)
        }
        .padding({ left: 16, right: 16 })
        .width('100%')

        Image(this.isClicked ? $r('app.media.ic_AI_read_on') : $r('app.media.ic_AI_read_normal'))
          .width(40)
          .height(40)
          .onClick(() => {
            this.isClicked = !this.isClicked;
            if (this.isClicked === true) {
              this.speaker.startSpeak(this.articleDetail!.brief)
            } else {
              this.speaker.stopSpeak();
            }
          })

        WebComponent({
          articleDetail: this.articleDetail
        })
      }
      .height('100%')
      // .justifyContent(FlexAlign.SpaceBetween)
    }
    .hideTitleBar(true)
  }
}

