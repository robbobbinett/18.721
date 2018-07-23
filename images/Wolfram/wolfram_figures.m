#!/afs/athena/software/math/current/bin/wolframscript -script

(*asymptote.png*)
s = 1/8;
eqn[x_,y_]:=s x y^4-y+s x;
p1 = ContourPlot[eqn[x,y]==0,{x,-5,5},{y,-10,10}];
p2 = ContourPlot[x==0,{x,-5,5},{y,-10,10},ContourStyle->Dashed];
Export["asymptote.png", Show[p1, p2]]
Clear[eqn]

(*capricornoid.png*)

eqn[a_,b_][x_,y_]:=a^2x^2(x^2+y^2)-b(a y-x^2-y^2)^2;
p1 := ContourPlot[(eqn[2,8][x,y]==0) // Evaluate,{x,-2.4,2.4},{y,-.1,2.5},Axes->False,AspectRatio->Automatic,MaxRecursion->6,ImageSize->Full,FrameStyle->White];
p2 := Plot[0,{x,-0.05,0.05},Axes->False, ImageSize->Full,FrameStyle->White];
Export["capricornoid.png", Show[p1, p2]]
Clear[eqn]

