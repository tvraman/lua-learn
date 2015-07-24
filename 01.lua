-- Compute factorial 

function fact (n)
   if (n == 1) then
      return 1
   else
      return n *fact(n-1)
   end
end

-- tail recursive factorial:

function factorial (n, ac)
   ac = ac or 1
   if n == 1 then return ac
   else return factorial (n-1, n*ac)
   end
end
-- Fibonacci generator

function makefib ()
   a,b =1,1
   return function ()
      a,b=b,a+b
      return a
   end
end
