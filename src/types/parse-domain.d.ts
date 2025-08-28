declare module 'parse-domain' {
	export enum ParseResultType {
		Listed = 'LISTED',
		NotListed = 'NOT_LISTED',
		Invalid = 'INVALID',
		Reserved = 'RESERVED',
		Unknown = 'UNKNOWN'
	}

	export interface ListedResult {
		type: ParseResultType.Listed;
		subDomains: string[];
		domain: string;
		topLevelDomains: string[];
	}

	export type ParseResult = ListedResult | { type: ParseResultType };

	export function parseDomain(input: string): ParseResult;
}


