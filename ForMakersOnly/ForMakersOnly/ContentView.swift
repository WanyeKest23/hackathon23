import SwiftUI

extension Color {
    init(hex: UInt) {
        self.init(
            red: Double((hex & 0xFF0000) >> 16) / 255.0,
            green: Double((hex & 0x00FF00) >> 8) / 255.0,
            blue: Double(hex & 0x0000FF) / 255.0
        )
    }
}

struct FontNameManager {
    struct Montserrat {
        static let light = "Montserrat"
        static let regular = "Montserrat-Regular"
        static let elight = "Montserrat-ExtraLight"
    }
}

let lightFont = Font.custom(FontNameManager.Montserrat.elight, size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)

let bodyFont = Font.custom(FontNameManager.Montserrat.regular, size: UIFont.preferredFont(forTextStyle: .body).pointSize)

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("TAYLOR CANDLE & CO")
                    .font(.largeTitle)

                Text("FOR MAKERS ONLY")
                    .font(lightFont)

                Text("When Life Gives You Wax, Wick It")

                NavigationLink(destination: Page2View()) {
                    Text("Select State")
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(8)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: 0xEDE7DF))
        }
    }
}

struct Page2View: View {
    var body: some View {
        VStack {
            Text("Product Page")
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct StateView: View {
    let stateOptions = ["Select State", "AZ", "CA", "NV"]
    @State private var selectedStateIndex = 0
    
    var body: some View {
        VStack {
            Text("Products By State")
                .font(.title)
                .padding()
            
            Picker("Select a state", selection: $selectedStateIndex) {
                ForEach(0..<stateOptions.count, id: \.self) {
                    index in Text(self.stateOptions[index])
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            if selectedStateIndex != 0 {
                NavigationLink(destination: destinationViewForSelectedProduct()){
                    Text("Go to Product Page")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
            } else {
                Text("Please select a state first")
                    .foregroundColor(.red)
                    .padding(.top, 20)
            }
        }
    }
}
  func
            switch selectedStateIndex {
            case 1:
                return AnyView(Page2View())
            case 2:
                return AnyView(CAProductsView())
            case 3:
                return AnyView(NVProductView())
            default:
                return AnyView(EmptyView())
            }
        }



NavigationLink(destination: destinationViewForSelectedProduct())
