//
//  WidgetHero.swift
//  WidgetHero
//
//  Created by Mehmet Ergün on 2022-06-24.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    @AppStorage("hero", store: UserDefaults(suiteName: "group.com.mehmetergun.HeroWidget"))
    var heroData: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: SuperHero(image: "superman", name: "Superman", realName: "Clark Kent"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData) {
            
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            completion(entry)
            
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData) {
            
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            let timeLine = Timeline(entries: [entry], policy: .never)
            completion(timeLine)
            
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let hero: SuperHero
}

struct WidgetHeroEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CircularImageView(image: Image(entry.hero.image))
    }
}

@main
struct WidgetHero: Widget {
    let kind: String = "WidgetHero"

    var body: some WidgetConfiguration {
        
    
        
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetHeroEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("Widget Hero")
    }
}


