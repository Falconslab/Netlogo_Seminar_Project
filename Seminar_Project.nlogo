extensions [ gis ]
globals [ countries-dataset
          should-draw-country-labels ]

breed [ country-labels country-label]
breed [ships ship]
breed [ports port]
breed [waypoints waypoint]

to setup
  clear-all
  ; Load the countries dataset
  set countries-dataset gis:load-dataset "data/countries.shp"
  ;set cities-dataset gis:load-dataset "data/cities.shp"
  ; Set the world envelope to the countries dataset's envelope
  gis:set-world-envelope (gis:envelope-of countries-dataset)
  if freeatday < blockedatday [error "The blockade needs to happen before it can be lifted"]


  draw-countries
  spawn-ports
  spawn-waypoints
  spawn-lanes
  connect-ports
  ;spawn-ships


  reset-ticks
end

; Draw the multi-polygon countries dataset to the drawing layer
to draw-countries
  gis:set-drawing-color green
  gis:draw countries-dataset 1
  ;gis:draw
end

to spawn-ports
  ; x and y cor in list then one of
  create-ports 1[
    set xcor 5
    set ycor 50
    set shape "crate"
    set size 5
    set color pink
  ]
  create-ports 1[
    set xcor 99
    set ycor 22
    set shape "crate"
    set size 5
    set color pink
  ]
end

to spawn-waypoints
  ;China to Eritrea
  create-waypoints 1 [
    set xcor 100
    set ycor 16
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 96
    set ycor 6
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 88
    set ycor 10
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 77
    set ycor 7
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 65
    set ycor 11
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 50
    set ycor 15
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 37
    set ycor 19
    set shape "flag"
    set color yellow
    set size 3
  ]

  ;Suez to Gibralta
  create-waypoints 1 [
    set xcor 31
    set ycor 31
    set shape "triangle 2"
    set color yellow
    set size 5
  ]
  create-waypoints 1 [
    set xcor 19
    set ycor 33
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 10
    set ycor 38
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor -3
    set ycor 37
    set shape "flag"
    set color yellow
    set size 3
  ]

  ;Africa to Portugal
  create-waypoints 1 [
    set xcor 44
    set ycor 5
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 38
    set ycor -4
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 37
    set ycor -12
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 34
    set ycor -18
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 28
    set ycor -26
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 19
    set ycor -29
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor 10
    set ycor -21
    set shape "flag"
    set color yellow
    set size 3
  ]create-waypoints 1 [
    set xcor -3
    set ycor -13
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor -13
    set ycor -1
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor -18
    set ycor 12
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor -18
    set ycor 25
    set shape "flag"
    set color yellow
    set size 3
  ]




  ; Coast of Portugal
  create-waypoints 1 [
    set xcor -13
    set ycor 37
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor -8
    set ycor 45
    set shape "flag"
    set color yellow
    set size 3
  ]
  create-waypoints 1 [
    set xcor -1
    set ycor 48
    set shape "flag"
    set color yellow
    set size 3
  ]
end




to spawn-lanes 
  let current-waypoints-count  0
  
    ask waypoint 2[ 
    repeat 5[
    let current-waypoints  waypoint (who + current-waypoints-count)
    let next-waypoints waypoint (who + 1 + current-waypoints-count) 
    set current-waypoints-count current-waypoints-count + 1
     if is-turtle? next-waypoints [
      ask current-waypoints [
        create-link-with next-waypoints
            ask links [
      set color red
      set thickness 1
    ]
        ]
      ]
    ]
    ] 
  
  if (plan = "waittillopen")[
     
    
    ask waypoint 2[ 
    repeat 5[
    let current-waypoints  waypoint (who + current-waypoints-count)
    let next-waypoints waypoint (who + 1 + current-waypoints-count) 
    set current-waypoints-count current-waypoints-count + 1
     if is-turtle? next-waypoints [
      ask current-waypoints [
        create-link-with next-waypoints
            ask links [
      set color red
      set thickness 1
    ]
        ]
      ]
    ]
      let current-waypoints waypoint (12)
      let next-waypoints waypoint (24)
       if is-turtle? next-waypoints [
      ask current-waypoints [
        create-link-with next-waypoints
            ask links [
      set color red
      set thickness 1
    ]
        ]
      ]
      
    ]
    
  ]
   if (plan = "divert")[
     ask waypoint 2[
    let current-waypoints  waypoint (who + current-waypoints-count)
    let next-waypoints waypoint (13) 
     if is-turtle? next-waypoints [
      ask current-waypoints [
        create-link-with next-waypoints
            ask links [
      set color red
      set thickness 1
    ]
        ]
      ]
    ]
    
    set current-waypoints-count current-waypoints-count + 6
    ask waypoint 2[ 
    repeat 11[
    let current-waypoints  waypoint (who + current-waypoints-count)  
    let next-waypoints waypoint (who + 1 + current-waypoints-count) 
    set current-waypoints-count current-waypoints-count + 1
     if is-turtle? next-waypoints [
      ask current-waypoints [
        create-link-with next-waypoints
            ask links [
      set color red
      set thickness 1
    ]
        ]
      ]
    ]
    ]
  ]
  
   ask waypoint 24[ 
    set current-waypoints-count 0
    repeat 3[
    let current-waypoints  waypoint (who + current-waypoints-count)
    let next-waypoints waypoint (who + 1 + current-waypoints-count) 
    set current-waypoints-count current-waypoints-count + 1
     if is-turtle? next-waypoints [
      ask current-waypoints [
        create-link-with next-waypoints
            ask links [
      set color red
      set thickness 1
    ]
        ]
      ]
    ]
  ]
  
  
end

to connect-ports
  ask port 0[
    create-link-with waypoint 26
            ask links [
      set color red
      set thickness 1
    ]
  ]
  
  
    ask port 1[
    create-link-with waypoint 2
            ask links [
      set color red
      set thickness 1
    ]
  ]
    
  
end





to spawn-ships
  create-ships 1[
    set xcor -70
    set ycor 33
    set shape "sailboat side"
    set size 10
    set color red
  ]
end

to follow-line
  ask ships[
    let current-port-cor [ (list xcor ycor)] of ports in-radius 5
    let current-port ports with [xcor = first item 0 current-port-cor and ycor = last item 0 current-port-cor ]
    print current-port
   ;let destination-port [other-end] of links with [end2 = current-port or end1 = current-port]
    ask current-port[
      ask one-of my-links [
        ; irgendwie turtles own oder glubul
        let x other-end
      ]
    ]

    ;print x
   ; print destination-port

    ;move-to item 1 destination-port-cor

  ]
end


to draw/clear-country-labels
  if-else should-draw-country-labels = 1 [
    set should-draw-country-labels 0
    ask country-labels [ die ]
  ] [
    set should-draw-country-labels 1
    foreach gis:feature-list-of countries-dataset [ this-country-vector-feature ->
      let centroid gis:location-of gis:centroid-of this-country-vector-feature
      ; centroid will be an empty list if it lies outside the bounds
      ; of the current NetLogo world, as defined by our current GIS
      ; coordinate transformation
      if not empty? centroid
      [ create-country-labels 1
        [ set xcor item 0 centroid
          set ycor item 1 centroid
          set size 0
          set label gis:property-value this-country-vector-feature "CNTRY_NAME"
        ]
      ]
    ]
  ]
end
