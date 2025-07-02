# Print last 10 history elements
function histop
  history | awk "{print \$2}" | sort | uniq -c | sort -nr | head -10
end

