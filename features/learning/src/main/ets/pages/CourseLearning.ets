import { webview } from '@kit.ArkWeb';


@Component
export struct CourseLearning {
  @State message: string = 'Hello World111123';
  private webviewController: webview.WebviewController = new webview.WebviewController();

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        // Web({ src: $rawfile('course_learning/index.html'), controller: this.webviewController })
        //   .domStorageAccess(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}
