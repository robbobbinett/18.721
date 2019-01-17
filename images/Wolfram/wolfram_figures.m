#!/afs/athena/software/math/current/bin/wolframscript -script

(*asymptote*)
s = 1/8;
eqn[x_,y_]:=s x y^4-y+s x;
p1 = ContourPlot[eqn[x,y]==0,{x,-5,5},{y,-10,10}, FrameStyle->White, ContourStyle->{Black}];
p2 = ContourPlot[x==0,{x,-5,5},{y,-10,10}, ContourStyle->{Dashed, Black}, FrameStyle->White];
Export["images/Wolfram/asymptote.pdf", Show[p1, p2]]
Clear[eqn]

(*capricornoid*)
eqn[a_,b_][x_,y_]:=a^2x^2(x^2+y^2)-b(a y-x^2-y^2)^2;
p1 := ContourPlot[(eqn[2,8][x,y]==0) // Evaluate,{x,-2.4,2.4},{y,-.1,2.5},Axes->False,AspectRatio->Automatic,MaxRecursion->6,ImageSize->Full,FrameStyle->White, ContourStyle->{Black}];
p2 := Plot[0,{x,-0.05,0.05},Axes->False, ImageSize->Full,FrameStyle->White, PlotStyle->{Black}];
Export["images/Wolfram/capricornoid.pdf", Show[p1, p2]]
Clear[eqn]

(*cubic*)
eqn[x_,y_]:= x^3-(1/2)x^2-x+1/2-y^2;
Export["images/Wolfram/cubic.pdf", ContourPlot[(eqn[x,y]==0) // Evaluate,{x,-2.4,2.4},{y,-3.5,3.5},AspectRatio->1,MaxRecursion->6,Axes->False,FrameStyle->White, ContourStyle->{Black}]]
Clear[eqn]

(*parametrized_cusp*)
eqn[x_,y_] := x^3-y^2;
Export["images/Wolfram/parametrized_cusp.pdf", ContourPlot[eqn[x,y]==0,{x,-1,1},{y,-1,1},Axes->False,FrameStyle->White,ImageSize->Full, ContourStyle->{Black}]]
Clear[eqn]

(*double_torus*)
eqn[x_,y_,z_]:=((x^2+y^2)^2-x^2+y^2)^2+15z^2 - 1/100;
Export["images/Wolfram/double_torus.pdf", ContourPlot3D[eqn[x,y,z]==0, {x,-1.2,1.2}, {y,-1,1}, {z,-0.2,0.2},Mesh->None,ContourStyle ->Directive[RGBColor[0.8,0.8,0.8]],Axes->False,MaxRecursion->15,BoxStyle->Directive[Opacity[0]],Lighting->{{"Directional", White, {0, 0, 3}}},ImageSize->Large]]
Clear[eqn]

(*ruled_hyperboloid---old*)
surf1[a_,c_][u_,v_]:={a Sqrt[1+u^2]Cos[v],a Sqrt[1+u^2]Sin[v],c u};
surf2[a_,c_][u_,v_]:={a Sinh[u]Cos[v],a Sinh[u]Sin[v],c u/Sqrt[u^2]Cosh[u]};
Export["images/Wolfram/ruled_hyperboloid.pdf", GraphicsRow[ParametricPlot3D[#[1,1][u,v],{u,-2,2},{v,0,2\[Pi]},Boxed->False,Axes->False,ColorFunction->Function[{x,y,z},1],PlotStyle->FaceForm[None]]&/@{surf1,surf2},ImageSize->400,Spacings->-50]]
Clear[surf1, surf2]

(*ruled_hyperboloid*)
surf1[a_,c_][u_,v_]:={a Sqrt[1+u^2]Cos[v],a Sqrt[1+u^2]Sin[v],c u};
surf2[a_,c_][u_,v_]:={a Sinh[u]Cos[v],a Sinh[u]Sin[v],c u/Sqrt[u^2]Cosh[u]};
Export["images/Wolfram/ruled_hyperboloid.pdf", GraphicsRow[ParametricPlot3D[#[1,1][u,v],{u,-2,2},{v,0,2\[Pi]},Boxed->False,Axes->False,ColorFunction->Function[{x,y,z},1],PlotStyle->FaceForm[None]]&/@{surf1,surf2},ImageSize->400,Spacings->-50]]
Clear[surf1, surf2]

(*trott_curve_tangents*)
eqn:=12^2(x^4+y^4)-15^2(x^2+y^2)+350x^2y^2+81;
Export["images/Wolfram/trott_curve_tangents.pdf", ContourPlot[{eqn\[Equal]0,x+0.445,y-0.708,y==x+1.21},{x,-1,1},{y,-1,1},ContourStyle->{{Black},{Gray,Dashed},{Gray,Dashed},{Gray,Dashed}},ImageSize->200, Frame->False]]
Clear[eqn]
