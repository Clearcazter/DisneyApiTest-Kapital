# DisneyApiTest-Kapital
iOS Prueba Técnica - Kapital. Desarrollado en SwiftUI aplicando principios SOLID Clean Architecture.

Aplicación iOS desarrollada en SwiftUI que consume la Disney API para mostrar un listado de personajes Disney, permitir ver el detalle de cada uno y marcarlos como favoritos. La app está construida bajo una arquitectura en capas con principios SOLID, y funciona en modo offline-first: los datos persisten localmente y están disponibles sin conexión a internet. (A exeoción de las imágenes ya que consideré, llenaría muy rapido la base de datos interna)


##Descripción del proyecto

 La app cuenta con dos pantallas principales accesibles desde un TabView:

Personajes: listado paginado de todos los personajes Disney que nos brinda la Disney Api, con scroll controlado por paginación, igual gracias a las capacidades del api ademas de pull-to-refresh.
Favoritos: listado de los personajes que el usuario marcó como favoritos, con persistencia utilizando Swift Data.

Arquitectura o capas utilizadas:

Presentation — Views (SwiftUI) y ViewModels (ObservableObject). Cada pantalla tiene su propio ViewModel, responsable únicamente del estado de UI. No conocen SwiftData ni la red y hacen uso de UseCases.

Domain — Use Cases y protocolos de Repository. Cada Use Case encapsula una única operación de negocio. Los ViewModels dependen de protocolos de Use Case (Dependency Inversion).

Data — Repositories y Data Sources. El Repository orquesta un data source remoto y uno local, y es el único punto donde se decide qué se persiste y cuándo. Los Data Sources son los únicos componentes que conocen URLSession/URLCache (remoto) o SwiftData (local).


#Librerías y frameworks utilizados

SwiftUIToda -> la interfaz de usuario, navegación y composición de vistas
Combine -> Através de ObservableObject / @Published en los ViewModelsSwiftDataPersistencia local de personajes y favoritos
URLSession + URLCache -> Networking y caché de imágenes/respuestas HTTP
XCTest -> Pruebas unitarias de ViewModels y Repositories

No se utilizaron dependencias externas (SPM/CocoaPods) — todo el proyecto se construye con frameworks nativos de Apple.

##Requisitos mínimos
 *Xcode: 15.0 o superior
 *iOS deployment target: 17.0 (requerido por SwiftData)
 *Swift: 5.9+
 *Simulador o dispositivo: iOS 17 o superior


Instrucciones para correr el proyecto

1 Clona o descarga el repositorio.
2 Abre DisneyCharacters.xcodeproj en Xcode.
3 Selecciona un simulador con iOS 17+ (por ejemplo, iPhone 15 o superior).
4 Compila y ejecuta con Cmd + R.

No se requiere configuración adicional, API keys, ni Podfile/Package.swift — la app está lista para correr de inmediato.


#Decisiones técnicas relevantes

##¿Por qué SwiftData y no Core Data?

Se eligió SwiftData porque:

Es la API moderna recomendada por Apple para persistencia, con integración nativa y declarativa en SwiftUI.
Reduce significativamente el boilerplate frente a Core Data y su configuración es mas rapida e inmediata.
Las consultas con FetchDescriptor y #Predicate son type-safe, lo que reduce errores en tiempo de ejecución.

##¿Por qué URLSession y no Alamofire?

La API de Disney es simple (GET, sin autenticación), por lo que no se necesitan las features avanzadas de Alamofire (interceptores complejos, multipart, etc.).
URLSession combinado con URLCache ya provee caché de respuestas HTTP en disco de forma nativa, cubriendo el requisito de disponibilidad offline para imágenes sin código adicional.
Evitar dependencias externas mantiene el proyecto ligero, sin necesidad de gestores de paquetes, y reduce la superficie de mantenimiento — relevante en el contexto de una prueba técnica donde se evalúa también la capacidad de resolver problemas con herramientas nativas.
