import type { Handle } from '@sveltejs/kit';
import { parseDomain, ParseResultType, type ListedResult } from 'parse-domain';

export const handle: Handle = async ({ event, resolve, }) => {
	// Parse subdomain from the request URL
	const url = new URL(event.request.url);
	const hostname = url.hostname;

	let subDomains: string[] | undefined;

	const parseResult = parseDomain(hostname);
	switch (parseResult.type) {
        case ParseResultType.Listed:
            const { subDomains: subDomainEntries } = parseResult as ListedResult;
            subDomains = subDomainEntries
            break;
    
        default:
            break;
    }
	
	// Populate subdomain information in locals
	event.locals.subDomains = subDomains;
	event.locals.hostname = hostname;
	
	// Continue with the request
	const response = await resolve(event);
	return response;
};
