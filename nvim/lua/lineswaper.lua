function swap_lines(n1, n2)
	local line1 = vim.fn.getline(n1)
	local line2 = vim.fn.getline(n2)


	vim.fn.setline(n2, line1)
	vim.fn.setline(n1, line2)
end
function swap_up()
    local n = vim.fn.line('.')
    if n == 1 then
        return
    end

    swap_lines(n, n - 1)
	vim.fn.execute( tostring(n - 1))
end


function swap_down()
    local n = vim.fn.line('.')
    if n == vim.fn.line('$') then
        return
    end

    swap_lines(n, n + 1)
	vim.fn.execute( tostring(n + 1))
end
