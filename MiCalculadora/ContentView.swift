import SwiftUI

struct ContentView: View {
    
    @State var numero1 : Int = 0
    @State var numero2 : Int = 0
    @State var total = 0
    
    enum Operacion{
        case suma
        case resta
        case multiplicacion
        case division
    }
    
    @State var operacion : Operacion = .suma
    
    var body: some View {
            VStack(){
                Text("Calculadora")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .padding()
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .padding(.vertical, 32.0)
                    .frame(width: 200)
                TextField("Digite primer número", value: $numero1, format: .number)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.black)
                    .font(.headline)
                    .keyboardType(.numberPad)
                TextField("Digite segundo número", value: $numero2, format: .number)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.black)
                    .font(.headline)
                    .keyboardType(.numberPad)
                Picker("Operación", selection: $operacion){
                    Text("Suma").tag(Operacion.suma)
                    Text("Resta").tag(Operacion.resta)
                    Text("Multiplicación").tag(Operacion.multiplicacion)
                    Text("División").tag(Operacion.division)
                }.pickerStyle(.menu)
                Button(action: {
                    realizarOperacion()
                }, label: {
                    Text("Calcular".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.cornerRadius(10))
                        .foregroundColor(.white)
                        .font(.headline)
                })
                .padding(.vertical, 32.0)
                Text(String(total))
                    .bold()
                    .font(.system(size: 20, design: .serif))
                    .italic()
                    .foregroundColor(Color.red)
                Spacer()
            }.padding()
    }
    
    func realizarOperacion(){
        switch(operacion){
        case .suma : total = numero1 + numero2
        case .resta : total = numero1 - numero2
        case .multiplicacion : total = numero1 * numero2
        default : total = numero1 / numero2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

