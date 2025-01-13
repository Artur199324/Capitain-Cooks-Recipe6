import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0.0
    @State private var animationCompleted: Bool = false
    @State private var showTermsWebView = false
    @State private var showPrivacyWebView = false
    @State private var menu = false
    var body: some View {
        VStack {
            Spacer()
            Image("10425317 copy 1")

            Spacer()
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 10)
                    .foregroundColor(Color.gray.opacity(0.3))
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: progress, height: 10)
                    .foregroundColor(.clear)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red, Color.yellow]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    )
                    .animation(.easeInOut(duration: 5), value: progress)
            }
            .frame(width: 200)
            .padding()
            .padding(.bottom,50)
            HStack(spacing:30){
                Button {
                    showTermsWebView = true
                } label: {
                    Text("Terms of Service").foregroundColor(.white)
                        
                }.sheet(isPresented: $showTermsWebView) {
                    WebView(url: URL(string: "https://sites.google.com/view/captain-kitchen-of-flavo-trms/")!)
                }
                
                Button {
                    showPrivacyWebView = true
                } label: {
                    Text("Privacy Policy").foregroundColor(.white)
                        
                }.sheet(isPresented: $showPrivacyWebView) {
                    WebView(url: URL(string: "https://sites.google.com/view/captain-kitchen-of-flavor-priv/")!)
                }

            }.padding(.bottom,100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backg").scaledToFill())
        .ignoresSafeArea()
        .onAppear {
            progress = 200
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                let logStatus = UserDefaults.standard.bool(forKey: "log")

                if logStatus {
                    menu.toggle()
                } else {
                    animationCompleted = true
                }
                          
                      }
        }
        .fullScreenCover(isPresented: $animationCompleted) {
            OnboardingView()
        }
        .fullScreenCover(isPresented: $menu) {
            MenuView()
        }
    }
}

#Preview {
    ContentView()
}
