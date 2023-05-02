import SwiftUI

struct View2: View {
    @Binding var push: Bool

    var body: some View {
        YourBalanceView()
    }
}

struct View1: View {
    @Binding var push: Bool

    var body: some View {
        
        ZStack {
            darkBackground
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Text("ENTO")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                Button(action: {
                    withAnimation(.easeOut(duration: 0.3)) {
                        self.push.toggle()
                    }
                }) {
                    Image("image1")
//                    Text("PUSH")
                }
                Text("Your financial assistant")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView: View {
    @State private var push = false

    var body: some View {
        ZStack {
            if !push {
                View1(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }

            if push {
                View2(push: $push)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
